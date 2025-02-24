package com.lmy.services.config;

import com.lmy.services.interceptor.UserAuthInterceptor;
import com.lmy.services.webSocket.WebSocketChildChannelHandler;
import com.lmy.services.webSocket.WebSocketServer;
import io.netty.bootstrap.ServerBootstrap;
import io.netty.channel.EventLoopGroup;
import io.netty.channel.nio.NioEventLoopGroup;
import jakarta.annotation.Resource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/*
 * @Description: 配置WebSocketServer
 */
@Configuration
public class ApplicationConfig implements WebMvcConfigurer {

    @Resource(name = "webSocketChildChannelHandler")
    private WebSocketChildChannelHandler webSocketChildChannelHandler;

    @Bean
    public WebSocketServer getWebSocketServer() {
        WebSocketServer webSocketServer = new WebSocketServer();
        webSocketServer.setPort(8003);
        webSocketServer.setChildChannelHandler(webSocketChildChannelHandler);
        return webSocketServer;
    }

    @Bean("bossGroup")
    public EventLoopGroup getBossGroup() {
        return new NioEventLoopGroup();
    }

    @Bean("workerGroup")
    public EventLoopGroup getWorkerGroup() {
        return new NioEventLoopGroup();
    }

    @Bean
    public ServerBootstrap getServerBootstrap(){
        return new ServerBootstrap();
    }

    // 配置拦截器
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new UserAuthInterceptor()).addPathPatterns("/chatroom/**");
    }

}
