package examples.tests;

import com.intuit.karate.junit5.Karate;

public class Runner3 {

    @Karate.Test
    public Karate runIngredient() {
        return Karate.run("Ingredients").relativeTo(getClass());
    }
}
