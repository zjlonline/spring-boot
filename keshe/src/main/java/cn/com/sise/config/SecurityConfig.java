//package cn.com.sise.config;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
//import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
//
//@EnableWebSecurity
//public class SecurityConfig extends WebSecurityConfigurerAdapter {
//    @Override
//    protected void configure(HttpSecurity http) throws Exception {
//        http.authorizeRequests().antMatchers("/layui/**","/img/**").permitAll()
//                .antMatchers("/**").permitAll()
//                .anyRequest().authenticated().and()
//                .formLogin();;
//        http.formLogin()
//                .loginPage("/userlogin").permitAll()
//                .usernameParameter("username").passwordParameter("password")
//                .defaultSuccessUrl("/login")
//                .failureUrl("/userlogin?error");
////    @Bean
////    public JdbcTokenRepositoryImpl tokenRepository(){
////        JdbcTokenRepositoryImpl jdbcTokenRepository=new JdbcTokenRepositoryImpl();
////        jdbcTokenRepository.setDataSource(dataSource);
////        return jdbcTokenRepository;
////    }
////    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
////        //  密码需要设置编码器
////        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
////        //1、使用JDBC进行身份认证
////        String userSQL ="select * from user u where username=?";
////        auth.jdbcAuthentication().passwordEncoder(encoder)
////                .dataSource(dataSource)
////                .usersByUsernameQuery(userSQL);
////
////    }
//
//}
//
