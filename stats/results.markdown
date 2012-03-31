I have performed multiple types of regression analysis on competing mutual funds to determine what we have to return to be competitive. For all types of funds, you can use a linear model to predict what competing funds average return will be given Net Asset Value (nav) and Expense Ratio (er) with the formula (predicted return = 0.214 + 11.669er + 0.153nav). Using this formula, the predicted return for competing funds of all types with an expense ration of 0.9 and a net asset value of 35, the predicted return would be (0.214 + 11.669(.9) + .153(35) = 16.07% return.
•	For Fixed Income Funds, you can use the model to predict returns of (predicted return = -.2653 + 9.984er + .199nav)
•	For International and Domestic Equity funds, a multiple regression linear model using net asset value and expense ratio values does not seem to be a good fit. This suggests that there are more factors that influence predicted returns than net asset value and expense ratios for these funds.
Moreover, it does not appear that net asset value is a very strong indicator of a fund’s expected returns. This suggests that we may use a simple linear regression model to predict competing fund’s returns using only expense ratios as a variable. This produces a prediction formula of (predicted return = 2.61 + 13.767er), so for a fund with an expense ratio of 1, the predicted return would be 2.61 + 13.767(1) = 16.377 %. The regression model has an r-squared value of .312, meaning that expense ratios account for approximately 31.2% of variation for predicted returns. Once again, this indicates that there are more factors at play than just expense ratios, as is expected. This model is a much better fit for Fixed Income funds, where predicted returns account for 82.4% of the variation in predicted return. With more variables and better technical analysis such as a logistical or exponential multiple regression model, perhaps a better form could be made. For more statistical analysis for every different variable for the different kinds of funds, you can refer to the appendix. 



Appendix
I did all of my statistical analysis in the ruby programming language, as I have excel for mac and couldn’t find any working extensions. My code can be found at https://github.com/hstove/Ruby-Scripts/blob/master/stats.rb and I used the ruby StatSample regression module.

~~~
The multiple regression model for all funds
= without ranking
  Engine: Statsample::Regression::Multiple::RubyEngine
  Cases(listwise)=45(45)
  R=0.611
  R^2=0.373
  R^2 Adj=0.343
  Std.Error R=7.137
  Equation=0.214 + 11.669er + 0.153nav
  == ANOVA
    ANOVA Table
+------------+----------+----+---------+--------+-------+
|   source   |    ss    | df |   ms    |   f    |   p   |
+------------+----------+----+---------+--------+-------+
| Regression | 1273.380 | 2  | 636.690 | 12.498 | 0.000 |
| Error      | 2139.546 | 42 | 50.942  |        |       |
| Total      | 3412.926 | 44 | 687.632 |        |       |
+------------+----------+----+---------+--------+-------+

  Beta coefficients
+----------+--------+-------+-------+-------+
|  coeff   |   b    | beta  |  se   |   t   |
+----------+--------+-------+-------+-------+
| Constant | 0.214  | -     | 3.151 | 0.068 |
| er       | 11.669 | 0.473 | 3.185 | 3.664 |
| nav      | 0.153  | 0.262 | 0.076 | 2.027 |
+----------+--------+-------+-------+-------+

For International Equities
= without ranking IE
  Engine: Statsample::Regression::Multiple::RubyEngine
  Cases(listwise)=8(8)
  R=0.650
  R^2=0.422
  R^2 Adj=0.191
  Std.Error R=10.789
  Equation=-14.715 + 31.323er + 0.241nav
  == ANOVA
    ANOVA Table
+------------+----------+----+---------+-------+-------+
|   source   |    ss    | df |   ms    |   f   |   p   |
+------------+----------+----+---------+-------+-------+
| Regression | 425.250  | 2  | 212.625 | 1.827 | 0.254 |
| Error      | 582.046  | 5  | 116.409 |       |       |
| Total      | 1007.295 | 7  | 329.034 |       |       |
+------------+----------+----+---------+-------+-------+

  Beta coefficients
+----------+---------+-------+--------+--------+
|  coeff   |    b    | beta  |   se   |   t    |
+----------+---------+-------+--------+--------+
| Constant | -14.715 | -     | 22.291 | -0.660 |
| er       | 31.323  | 0.653 | 16.850 | 1.859  |
| nav      | 0.241   | 0.317 | 0.268  | 0.901  |
+----------+---------+-------+--------+--------+

For Fixed income funds
= without ranking FI
  Engine: Statsample::Regression::Multiple::RubyEngine
  Cases(listwise)=10(10)
  R=0.908
  R^2=0.824
  R^2 Adj=0.773
  Std.Error R=1.506
  Equation=-2.653 + 9.984er + 0.199nav
  == ANOVA
    ANOVA Table
+------------+--------+----+--------+--------+-------+
|   source   |   ss   | df |   ms   |   f    |   p   |
+------------+--------+----+--------+--------+-------+
| Regression | 74.190 | 2  | 37.095 | 16.350 | 0.002 |
| Error      | 15.882 | 7  | 2.269  |        |       |
| Total      | 90.071 | 9  | 39.364 |        |       |
+------------+--------+----+--------+--------+-------+

  Beta coefficients
+----------+--------+-------+-------+--------+
|  coeff   |   b    | beta  |  se   |   t    |
+----------+--------+-------+-------+--------+
| Constant | -2.653 | -     | 3.715 | -0.714 |
| er       | 9.984  | 0.942 | 1.793 | 5.569  |
| nav      | 0.199  | 0.119 | 0.283 | 0.702  |
+----------+--------+-------+-------+--------+

for domestic equity funds
= without ranking DE
  Engine: Statsample::Regression::Multiple::RubyEngine
  Cases(listwise)=27(27)
  R=0.205
  R^2=0.042
  R^2 Adj=-0.038
  Std.Error R=2.954
  Equation=13.858 + 1.868er + -0.011nav
  == ANOVA
    ANOVA Table
+------------+---------+----+--------+-------+-------+
|   source   |   ss    | df |   ms   |   f   |   p   |
+------------+---------+----+--------+-------+-------+
| Regression | 9.223   | 2  | 4.612  | 0.528 | 0.596 |
| Error      | 209.487 | 24 | 8.729  |       |       |
| Total      | 218.710 | 26 | 13.340 |       |       |
+------------+---------+----+--------+-------+-------+

  Beta coefficients
+----------+--------+--------+-------+--------+
|  coeff   |   b    |  beta  |  se   |   t    |
+----------+--------+--------+-------+--------+
| Constant | 13.858 | -      | 2.330 | 5.949  |
| er       | 1.868  | 0.202  | 1.851 | 1.009  |
| nav      | -0.011 | -0.049 | 0.043 | -0.246 |
+----------+--------+--------+-------+--------+

Simple Regression
= expense ratio to return IE
  Table 1
+----------+--------+
| Variable | Value  |
+----------+--------+
| r        | 0.573  |
| r^2      | 0.328  |
| a        | -2.427 |
| b        | 27.473 |
| s.e      | 10.619 |
+----------+--------+

= expense ratio to return FI
  Table 1
+----------+--------+
| Variable | Value  |
+----------+--------+
| r        | 0.901  |
| r^2      | 0.811  |
| a        | -0.143 |
| b        | 9.549  |
| s.e      | 1.458  |
+----------+--------+

= expense ratio to return DE
  Table 1
+----------+--------+
| Variable | Value  |
+----------+--------+
| r        | 0.199  |
| r^2      | 0.040  |
| a        | 13.536 |
| b        | 1.845  |
| s.e      | 2.898  |
+----------+--------+

= expense ratio to return
  Table 1
+----------+--------+
| Variable | Value  |
+----------+--------+
| r        | 0.558  |
| r^2      | 0.312  |
| a        | 2.610  |
| b        | 13.767 |
| s.e      | 7.391  |
+----------+--------+

~~~
This is the residual plot for the multiple regression model for all fund types, with expense ratio and net asset value as the variables. The residuals get bigger as the observed return increases, suggesting that a different model, perhaps an exponential model, would be better. Clearly the residuals are not independent. 
