internal extension Array {
    /**
    Creates the parameters key, value pair array.
     Sorts the parameters, by name, using ascending byte value ordering.
     */
    var parameters: [(key: String, value: String)] {
        get{
            var array = [(key: String, value: String)]()

            for (key,value) in FatSecretParams.oAuth {
                array.append((key: key, value: value))
            }

            for (key,value) in FatSecretParams.fatSecret {
                array.append((key: key, value: value))
            }

            return array.sorted(by: { $0 < $1 })
        }
    }
}
