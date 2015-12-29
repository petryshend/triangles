class Triangle
{
    final int LONG_SIDE = 20;
    final int SHORT_SIDE = 10;

    float x;
    float y;
    float speed;
    String type;
    String pointing;
    String direction;

    Triangle(float x, float y, String type, String pointing, String direction)
    {
        this.x = x;
        this.y = y;
        this.speed = 1;
        this.type = type;
        this.pointing = pointing;
        this.direction = direction;
    }

    void update()
    {
        if (this.direction.equals("up")) {
            this.y -= this.speed;
        } else if (this.direction.equals("down")) {
            this.y += this.speed;
        } else if (this.direction.equals("left")) {
            this.x -= this.speed;
        } else if (this.direction.equals("right")) {
            this.x += this.speed;
        }
    }

    void edges()
    {
        if (this.x > width + LONG_SIDE) {
            this.x = -LONG_SIDE;
        } else if (this.x < -LONG_SIDE) {
            this.x = width + LONG_SIDE;
        }
        if (this.y > height + LONG_SIDE) {
            this.y = -LONG_SIDE;
        } else if (this.y < -LONG_SIDE) {
            this.y = height + LONG_SIDE;
        }
    }

    void display()
    {
        float x1 = 0, y1 = 0, x2 = 0, y2 = 0, x3 = 0, y3 = 0;
        if (this.pointing.equals("left")) {
            x1 = this.x - LONG_SIDE;
            y1 = this.y;
            x2 = this.x + LONG_SIDE;
            y2 = this.y - SHORT_SIDE;
            x3 = this.x + LONG_SIDE;
            y3 = this.y + SHORT_SIDE;
        } else if (this.pointing.equals("right")) {
            x1 = this.x + LONG_SIDE;
            y1 = this.y;
            x2 = this.x - LONG_SIDE;
            y2 = this.y + SHORT_SIDE;
            x3 = this.x - LONG_SIDE;
            y3 = this.y - SHORT_SIDE;
        } else if (this.pointing.equals("up")) {
            x1 = this.x;
            y1 = this.y - LONG_SIDE;
            x2 = this.x + SHORT_SIDE;
            y2 = this.y + LONG_SIDE;
            x3 = this.x - SHORT_SIDE;
            y3 = this.y + LONG_SIDE;
        } else if (this.pointing.equals("down")) {
            x1 = this.x;
            y1 = this.y + LONG_SIDE;
            x2 = this.x - SHORT_SIDE;
            y2 = this.y - LONG_SIDE;
            x3 = this.x + SHORT_SIDE;
            y3 = this.y - LONG_SIDE;
        }

        if (this.type.equals("green")) {
            fill(21, 171, 0);
        } else if (this.type.equals("orange")) {
            fill(255, 150, 0);
        }

        strokeWeight(1);
        triangle(x1, y1, x2, y2, x3, y3);
    }
}