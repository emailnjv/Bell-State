namespace Bell_State {
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Primitive;

    operation Set (desired: Result, q1: Qubit) : () {
        body {
            let current = M(q1);
            if (desired != current){
                X(q1);
        }
    }
}
