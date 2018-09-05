package node

// Configuration save master and workers' configuration
type Configuration struct {
	MasterAddr string
	Workers    int
	ChunkSize  int
}
