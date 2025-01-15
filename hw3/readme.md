#   小波与微分方程
##  问题
本次作业主要利用Haar小波求解以下的非线性分数阶偏微分方程。
$$\frac{\partial ^{\alpha}u}{\partial t^{\alpha}} = \frac{\partial^{\beta}u}{\partial x^{\beta}} F(u(x,t))+f(x,t)$$

其中$\alpha,\beta \in \mathbb{Q} ^{+}$，$\frac{\partial ^{\alpha}u}{\partial t^{\alpha}}$表示Caputo分数阶导数，
$\frac{\partial^{\beta}u}{\partial x^{\beta}}$表示Riemann-Liouville分数阶导数。为简单起见，本次作业中令$\beta \in \{0,1\}$，只考虑Caputo分数阶导数。
Caputo分数阶导数的定义如下：
$$D^{\alpha}_{*}f(t)=\frac{1}{\Gamma(m-\alpha)}\int_{a}^{t}\frac{f(t)^{(m)}}{(t-T)^{\alpha-m+1}}dT,0\leqslant m-1<\alpha\leqslant m$$
##  算法
### 用Haar小波逼近函数
Haar小波函数定义为：
$$H(t)=\left\{\begin{aligned}
    1, & 0 \leqslant t<\frac{1}{2} \\
    -1, & \frac{1}{2} \leqslant t<1 \\
    0, & \text { 其他 }
\end{aligned}\right.$$

对$j \in \mathbb{N},k=0,1,...,2^{j}-1$，令$i=2^{j}+k,h_i(t)=2^{\frac{j}{2}}H(2^jt-k),h_0(t)=1$

那么在区间$[0,1]$上定义的函数$f(t)$可表示为
$$f(t)=\sum_{i=0}^{\infty}c_ih_i(t)$$

其中$c_i$为小波系数，$c_i=\int_{0}^{1}f(t)h_i(t)dt$,令$l$是2的整数次幂，$l=2^L$，则有f(t)的逼近函数为

$$f(t)\approx f_l(t)=\sum_{i=0}^{l-1}c_ih_i(t)$$

### Haar小波的分数阶积分算子矩阵
上述提到的小波基函数$h_i(t)$合成一个列向量
$$H_k(t)=[h_0(t),h_1(t),...,h_{k-1}(t)]^T$$

若$I^{\alpha}$表示分数阶积分算子，那么有
$$(I^{\alpha}H_k)(t)=P^{\alpha}_{k\times k}H_k(t)$$

其中$P^{\alpha}_{k\times k}$是一个$k\times k$的矩阵，称为Haar小波的分数阶积分算子矩阵，其定义如下
$$P^{\alpha}_{k\times k}=H_{k\times k}F_{\alpha}H^{-1}_{k\times k}$$
$$H_{k\times k}=[H_k(1/2k),H_k(3/2k),...,H_k((2k-1)/2k)]$$

$$F_{\alpha}=\frac{1}{m^{\alpha}\Gamma(\alpha+2)}
\left[
\begin{matrix}    
    1&\xi _1&\xi_2&...&\xi_{m-1}\\
    &1&\xi_1&...&\xi_{m-2}\\
    &&1&...&\xi_{m-3}\\
    &&&\ddots&\vdots\\
    &&&&1    
\end{matrix}
\right]
$$

$$\xi_k=(k+1)^{\alpha+1}-2k^{\alpha+1}+(k-1)^{\alpha+1}$$

### 转化为代数方程组
####    分数阶常微分方程
考虑如下的分数阶常微分方程：
$$\frac{\partial^{\frac{1}{3}}u(t)}{\partial t^{\frac{1}{3}}}+t^{\frac{1}{3}}u(t)=\frac{3}{2\Gamma(\frac{2}{3})}t^{\frac{2}{3}}+t^{\frac{4}{3}}$$
$$u(0)=0$$

此时方程的准确解为
$$u(t)=t$$

令
$$\frac{\partial^{\frac{1}{3}}u(t)}{\partial t^{\frac{1}{3}}}=\sum_{i=0}^{l-1}c_ih_i(t)=c^TH_l(t)$$

则有
$$u(t)\approx u_l(t)=c^TP^{\alpha}H_l(t)$$

原方程组可写为
$$c^TH_l(t)+t^{\frac{1}{3}}c^TP^{\alpha}H_l(t)=\frac{3}{2\Gamma(\frac{2}{3})}t^{\frac{2}{3}}+t^{\frac{4}{3}}$$

对区间$[0,1]$进行离散化，令$t_k=\frac{2k-1}{2l},k=1,2,...,l$，将$a(t)=t^{\frac{1}{3}},f(t)=\frac{3}{2\Gamma(\frac{2}{3})}t^{\frac{2}{3}}+t^{\frac{4}{3}}$分别表示成对角阵$A$列向量$f$，则有
$$c^TH+c^TP^{\alpha}HA=f^T$$
####    分数阶偏微分方程
考虑如下的分数阶偏微分方程：
$$\frac{\partial^{\alpha}u}{\partial t^{\alpha}} + u(x,t)\frac{\partial u}{\partial x}=f(x,t)$$
$$f(x,t)=x+xt^2$$

如上述的分数阶常微分方程，有
$$\frac{\partial^{\alpha+1}}{\partial t^{\alpha} \partial x}u(x,t)\approx \sum_{i,j}^{l}c_{ij}h_i(x)h_j(t)$$

$$u(x,t)=H(x)^T(P^1)^TCP^{\alpha}H(t)$$

简单起见将$P$表示积分指数的上标下移，对$x,t$在区间$[0,1]\times [0,1]$作如上题的等分。原方程组可写为
$$H^TP^T_{1}CH+H^TP^T_1CP_{\alpha}H H^TCP_{\alpha}H= f$$

由上述$h_i$定义，可知$HH^T=lI$，则方程组可转为
$$P^T_{1}C+P^T_1CP_{\alpha}lCP_{\alpha}=H fH^T/l^2$$

## Unsolved
The PDE part has some problems, mainly about how to compute $\frac{\partial^{\alpha}}{\partial x^{\alpha}}$ by matrix multiplication.

##  Reference
[1] M. Mehra, 《Wavelets and Differential Equations-A short review》, AIP Conference Proceedings, 卷 1146, 页 241–252, 7月 2009, doi: 10.1063/1.3183545.

[2] 郝玲, 牛红玲, 成福伟和尹建华, 《小波法求解非线性分数阶偏微分方程》, 河北师范大学学报（自然科学版）, 卷 37, 期 5, 页 453–457, 2013, doi: 10.13763/j.cnki.jhebnu.nse.2013.05.018.

[3] Y. Chen, M. Yi和C. Yu, 《Error analysis for numerical solution of fractional differential equation by Haar wavelets method》, Journal of Computational Science, 卷 3, 期 5, 页 367–373, 9月 2012, doi: 10.1016/j.jocs.2012.04.008.

[4] C. F. Chen和C. H. Hsiao, 《Haar wavelet method for solving lumped and distributed-parameter systems》, IEE Proceedings - Control Theory and Applications, 卷 144, 期 1, 页 87–94, 1月 1997, doi: 10.1049/ip-cta:19970702.
