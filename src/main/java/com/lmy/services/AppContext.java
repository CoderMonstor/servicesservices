package com.lmy.services;

import com.lmy.services.webSocket.WebSocketServer;
import jakarta.annotation.PostConstruct;
import jakarta.annotation.PreDestroy;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component
@Scope("singleton")
public class AppContext {

    private static final Logger logger = LoggerFactory.getLogger(AppContext.class);

    @Autowired
    private WebSocketServer webSocketServer;
    private Thread nettyThread;

    /**
     * 描述：Tomcat加载完ApplicationContext-main和netty文件后：
     *      1. 启动Netty WebSocket服务器；
     *      2. 加载用户数据；
     *      3. 加载用户交流群数据。
     */
    @PostConstruct
    public void init() {
        nettyThread = new Thread(webSocketServer);
        logger.info("开启独立线程，启动Netty WebSocket服务器...");
        nettyThread.start();
    }

    /**
     * 描述：Tomcat服务器关闭前需要手动关闭Netty Websocket相关资源，否则会造成内存泄漏。
     *      1. 释放Netty Websocket相关连接；
     *      2. 关闭Netty Websocket服务器线程。（优雅关闭）
     */
    @PreDestroy
    public void close() {
        logger.info("正在释放Netty Websocket相关连接...");
        webSocketServer.close();

        if (nettyThread != null && nettyThread.isAlive()) {
            try {
                logger.info("正在等待Netty Websocket服务器线程优雅关闭...");
                nettyThread.join(5000); // 等待最多5秒
            } catch (InterruptedException e) {
                logger.error("等待Netty Websocket服务器线程关闭时被中断", e);
                Thread.currentThread().interrupt(); // 恢复中断状态
            }
        }

        logger.info("系统成功关闭！");
    }
}
