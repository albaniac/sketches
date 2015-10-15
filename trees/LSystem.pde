public interface IRule {
  char GetSource();
  String GetResult();
}

public class RandomRule implements IRule {
  public char Source;
  public String Result1;
  public String Result2;

  public RandomRule(char source, String result1, String result2) {
    Source= source;
    Result1 = result1;
    Result2 = result2;
  }

  public char GetSource() {
    return Source;
  }

  public String GetResult() {
    float rnd = random(0, 1);
    String result = "";
    if (rnd>0.5) {
      result = Result1;
    } else {
      result = Result2;
    }
    return result;
  }
}

public class Rule implements IRule {

  public char Source;
  public String Result;

  public char GetSource() {
    return Source;
  }

  public String GetResult() {
    return Result;
  }

  public Rule(char source, String result) {
    this.Source = source;
    this.Result = result;
  }
}

public class LSystem {

  public String Axiom;
  public IRule[] Ruleset;

  public String currentGeneration;

  public LSystem(String axiom, IRule[] rules) {
    currentGeneration = axiom;
    Ruleset = rules;
  }


  public void Generate()
  {
    StringList strings = new StringList();
    //String nextGeneration = "";
    for (int i = 0; i < currentGeneration.length(); i++) {
      strings.append(getMutation(currentGeneration.charAt(i)));
      //nextGeneration += getMutation(currentGeneration.charAt(i));
    }
    currentGeneration = join(strings.array(), "");
  }

  private String getMutation(char source) {
    String result = "" + source;
    for (int i=0; i< Ruleset.length; i++) {
      IRule cRule = Ruleset[i];
      if (source == cRule.GetSource()) {
        result = cRule.GetResult();
        break;
      }
    }
    return result;
  }
}