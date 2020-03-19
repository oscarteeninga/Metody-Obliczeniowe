import numpy as np
import pygame
from random import random

# screen resolution - must be even


# colours
LIGHT_GRAY = (240, 240, 240)
WHITE = (255, 255, 255)
BLACK = (0, 0, 0)
RED = (255, 50, 50)
BLUE = (0, 0, 255)
GREEN = (0, 255, 0)
YELLOW = (255, 255, 0)
ORANGE = (255, 64, 0)

SCREEN_SIZE = 800

class Metropolis:
    def __init__(self):
        pygame.init()
        self.screen = pygame.display.set_mode((SCREEN_SIZE, SCREEN_SIZE))
        self.N = int(SCREEN_SIZE/400)
        self.POINTS = [[[0,0,0] for _ in range(0, self.N)] for _ in range(0, self.N)]
        for i in range(0, self.N):
            for j in range(0, self.N):
                self.POINTS[i][j] = [int(i*SCREEN_SIZE/self.N), int(j*SCREEN_SIZE/self.N), random() % 2]

    def get_color(self, tmp):
        if tmp == 0:
            return RED
        else:
            return BLUE

    def display_points(self):
        for i in range(0, self.N):
            for j in range(0, self.N):
                color = self.get_color(self.POINTS[i][j][2])
                pygame.draw.circle(self.screen, color, (self.POINTS[i][j][0], self.POINTS[i][j][1]), 1, 0)
        pygame.display.update()

    def change_points(self):
        while True:
            pygame.time.delay(16)
            self.POINTS[int(random() % self.N)][int(random() % self.N)][2] = random() % 2
            self.display_points()

m = Metropolis()
m.display_points()

    



