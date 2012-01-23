import os

def update():
    """Call through the the hard working update function.
    """

    os.system('cd /opt/pergola/fab && fab update')

if __name__ == '__main__':
    update()
