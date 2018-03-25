using Microsoft.Quantum.Simulation.Core;
using Microsoft.Quantum.Simulation.Simulators;

namespace Bell_State
{
    class Driver
    {
        static void Main(string[] args) {

            // Cast QuantumSimulator instance to var for iteration
            using (var sim = new QuantumSimulator()) {

                // try initial values
                Result[] initials = new Result[] { Result.Zero, Result.One};

                // Loop through using simulator, 1000 for the seed, and supplied amount of threads
                foreach (Result initial in initials){
                    var res = BellTest.Run(sim, 1000, initial).Result;
                    var (numZeros, numOnes) = res;

                    // Outputs the results
                    System.Console.WriteLine(
                        $"Init:{initial, -4} Number of Zeros={numZeros, -4} Number of Ones={numOnes, -4}"
                    );
                }
            }
            // Ending Prompt
            System.Console.WriteLine("Press any key to continue...");
            System.Console.ReadKey();
        }
    }
}