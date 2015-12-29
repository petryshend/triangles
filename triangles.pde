Triangle t;
int score;

int keyReleasedCode = 0;

String[] types = {"green", "orange"};
String[] directions = {"left", "right", "up", "down"};

void setup()
{
    size(640, 360);
    t = new Triangle(width / 2, height / 2, "orange", "right", "right");
    score = 0;
}

void draw()
{
    background(255);

    drawScore();

    handleKeys();

    t.edges();
    t.update();
    t.display();
}

void drawScore()
{
    fill(0);
    textSize(18);
    text("Score: " + score, 5, 20);
}

void keyReleased()
{
    keyReleasedCode = keyCode;
}

Triangle generateTriangle()
{
    String type = types[(int) random(types.length)];
    String pointing = directions[(int) random(directions.length)];
    String direction = directions[(int) random(directions.length)];
    return new Triangle(width / 2, height / 2, type, pointing, direction);
}

void checkKey(Triangle t, String keyName)
{
    if (t.type.equals("green") && t.pointing.equals(keyName)) {
        score++;
    } else if (t.type.equals("orange") && t.direction.equals(keyName)) {
        score++;
    } else {
        score--;
    }
}

void handleKeys()
{
    if (keyReleasedCode == UP) {
        checkKey(t, "up");
        t = generateTriangle();
    } else if (keyReleasedCode == DOWN) {
        checkKey(t, "down");
        t = generateTriangle();
    } else if (keyReleasedCode == LEFT) {
        checkKey(t, "left");
        t = generateTriangle();
    } else if (keyReleasedCode == RIGHT) {
        checkKey(t, "right");
        t = generateTriangle();
    }
    keyReleasedCode = 0;
}