import matplotlib.pyplot as plt
from data import polls

poll_titles = [poll[0] for poll in polls]
poll_men = [poll[1] for poll in polls]
poll_woman = [poll[2] for poll in polls]

poll_x_coordinates = range(len(polls))

figure = plt.figure(figsize=(6, 6),linewidth = 5)
figure.subplots_adjust(bottom = 0.35)
axes = figure.add_subplot()

men_plot = axes.bar(
    poll_x_coordinates,
    poll_men,
    tick_label = poll_titles
    
)
woman_plot = axes.bar(
    poll_x_coordinates,
    poll_woman,
    tick_label = poll_titles,
    bottom = poll_men,

)

axes.legend((men_plot, woman_plot),("Men","Woman"))

plt.xticks(poll_x_coordinates, poll_titles,rotation= 30, ha ="right")

figure.savefig("graph.png",bbox_inches= "tight")