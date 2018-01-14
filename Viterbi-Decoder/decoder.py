#Viterbi Decoder
import numpy as np
 
class Decoder(object):
    def __init__(self, initialProb, transProb, obsProb):
        self.N = initialProb.shape[0]
        self.initialProb = initialProb
        self.transProb = transProb
        self.obsProb = obsProb
        assert self.initialProb.shape == (self.N, 1)
        assert self.transProb.shape == (self.N, self.N)
        assert self.obsProb.shape[0] == self.N
 
    def Obs(self, obs):
        return self.obsProb[:, obs, None]
 
    def Decode(self, lenobs):
        trellis = np.zeros((self.N, lenobs))
        backpt = np.ones((self.N, lenobs), 'int32') * -1
        # initialization
        trellis[:, 0] = np.squeeze(self.initialProb + self.Obs(0))

        for t in xrange(1, lenobs):
            pres_obs = self.Obs(t)
            temp = np.array([[trellis[j,t-1]+pres_obs[i,0] for i in range(self.N)] for j in range(self.N)] )
            trellis[:,t] = (temp + self.transProb).max(0) 
            backpt[:, t] = (np.tile(trellis[:, t-1, None], [1, self.N]) + self.transProb).argmax(0)
        # termination
        tokens = [trellis[:, -1].argmax()]
        for i in xrange(lenobs-1, 0, -1):
            tokens.append(backpt[tokens[-1], i])
        return tokens[::-1]

