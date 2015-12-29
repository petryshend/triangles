Triangle[] triangles = new Triangle[20];
int score;

int keyReleasedCode = 0;

String[] types = {"green", "orange"};
String[] directions = {"left", "right", "up", "down"};

void setup()
{
    size(640, 360);
    generateTriangles();
    score = 0;
}

void draw()
{
    background(255);
    handleKeys();
    updateTriangles();
    drawScore();
}

void drawScore()
{
    fill(0);
    textSize(18);
    text("Score: " + score, 5, 20);
}

void updateTriangles()
{
    for (Triangle t : triangles) {
        t.edges();
        t.update();
        t.display();
    }
}

void keyReleased()
{
    keyReleasedCode = keyCode;
}

void generateTriangles()
{
    String type = types[(int) random(types.length)];
    String pointing = directions[(int) random(directions.length)];
    String direction = directions[(int) random(directions.length)];
    for (int i = 0; i < triangles.length; i++) {
        triangles[i] = new Triangle(random(0, width), random(0, height), type, pointing, direction);
    }
}

void checkKey(String keyName)
{
    if (triangles[0].type.equals("green") && triangles[0].pointing.equals(keyName)) {
        score++;
    } else if (triangles[0].type.equals("orange") && triangles[0].direction.equals(keyName)) {
        score++;
    } else {
        score--;
    }
}

void handleKeys()
{
    if (keyReleasedCode == UP) {
        checkKey("up");
        generateTriangles();
    } else if (keyReleasedCode == DOWN) {
        checkKey("down");
        generateTriangles();
    } else if (keyReleasedCode == LEFT) {
        checkKey("left");
        generateTriangles();
    } else if (keyReleasedCode == RIGHT) {
        checkKey("right");
        generateTriangles();
    }
    keyReleasedCode = 0;
}