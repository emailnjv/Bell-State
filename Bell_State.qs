namespace Bell_State {
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Primitive;

    operation Set (desired: Result, q1: Qubit) : () {
        body {

            // Measures the current state of the supplied Qubit on computational Z basis
            let current = M(q1);

            // If it doesn't match desired state flip it aournd on X axis using the Gate
            if (desired != current){
                X(q1);
        }
    }

    // Loops through count iterator, sets value on qubit, measures it, records data, and then resets qubit back to know state of |0>
    operation BellTest (count : Int, initial: Result) : (Int,Int) {
        body {

            // Initialize counter var
            mutable numOnes = 0;

            // Ensures that after we perform check, we reset Qubit to desired know state |0>
            // Will flag end with ***
            using (qubits = Qubit[1]) {
            for (test in 1..count) {

                // Calls the Set operation to apply / verify state against supplied desired state
                Set (initial, qubits[0]);

                // Sets variable to mesured state
                let res = M (qubits[0]);

                // Counts amount of Qubits set to |1>
                if (res == One){
                    set numOnes = numOnes + 1;
                }
            }
            // ***
            Set(Zero, qubits[0]);
        }
        // Return number of times we saw a |0> and number of times we saw a |1>
        return (count - numOnes, numOnes);
    }
}
