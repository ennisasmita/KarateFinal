package examples.tests;

import com.intuit.karate.junit5.Karate;

public class RunnerKaratePractice {
    @Karate.Test
    public Karate runIngredient() {
        return Karate.run("Ingredients").relativeTo(getClass());
    }
}
