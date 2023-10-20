import matplotlib.pyplot as plt
import numpy as np


gradient = np.linspace(0, 1, 10)
cmaps = ['viridis', 'plasma', 'inferno', 'magma', 'cividis']

for cmap_name in cmaps:
    cmap = plt.get_cmap(cmap_name)

    print('')
    print(f'<!-- {cmap_name.capitalize()} color palette -->')

    colors = cmap(gradient)

    for i, color in enumerate(colors):
        r, g, b, a = color
        print(f'<color name="{cmap_name}_{i}" value="{r:.3f} {g:.3f} {b:.3f}" />')
