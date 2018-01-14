import numpy as np

'''
N: number of hidden states
'''
class Decoder(object):
    def __init__(self, initialProb, transProb, obsProb):
        self.N = initialProb.shape[0]
        self.initialProb = np.log10(initialProb)
        self.transProb = np.log10(transProb)
        self.obsProb = np.log10(obsProb)

        assert self.initialProb.shape == (self.N, 1)
        assert self.transProb.shape == (self.N, self.N)
        assert self.obsProb.shape[0] == self.N
        
    def Obs(self, obs):
        return self.obsProb[:, obs, None]

    def Decode(self, obs):
        trellis = np.zeros((self.N, len(obs)))
        backpt = np.ones((self.N, len(obs)), 'int32') * -1
        print trellis, trellis.shape
                
        # initialization
        print "before",trellis[:,0]
        print "self.Obs(obs[0])", self.Obs(obs[0])
        print "initialProb", self.initialProb
        trellis[:, 0] = np.squeeze(self.initialProb + self.Obs(obs[0]))
        print "after",trellis[:,0]
        print  "newaxis",trellis[:, 0, None]
        print "treliis",trellis, trellis.shape

        for t in xrange(1, len(obs)):
            print "arra",trellis[:, t-1, None].dot(self.Obs(obs[t]).T).shape, "mnn", self.Obs(obs[t]).shape
            trellis[:, t] = (trellis[:, t-1, None].dot(self.Obs(obs[t]).T) * self.transProb).max(0)
            pres_obs = self.Obs(obs[t])
            print "trellis shapr", trellis[:,t-1], trellis[:,t-1].shape
            print "obs", pres_obs, pres_obs.shape
            print self.transProb.shape,"trans"
            temp = np.array([[trellis[j,t-1]+pres_obs[i,0] for i in range(self.N)] for j in range(self.N)] ) 
            print "temp", temp
            trellis[:,t] = (temp + self.transProb).max(0) 
            backpt[:, t] = (np.tile(trellis[:, t-1, None], [1, self.N]) + self.transProb).argmax(0)
        # termination
        tokens = [trellis[:, -1].argmax()]
        for i in xrange(len(obs)-1, 0, -1):
            tokens.append(backpt[tokens[-1], i])
        return tokens[::-1]