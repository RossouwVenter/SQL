import matplotlib.pyplot as plt
import charts
import databse

charts.create_bar_chart(databse.get_polls_and_votes())
plt.show()