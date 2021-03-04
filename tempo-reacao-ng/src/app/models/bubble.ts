import { COLOR } from "../enums/color";

class Bubble {
    static qtdColors: number = 3;

    key: string;
    constructor(
        private id: number,
        private color: COLOR = COLOR.LIGHT,
    ) {
        this.colorValue = this.color;
    }

    set colorValue(c: COLOR) {
        this.color = c;
        switch (this.color) {
            case COLOR.RED:
                this.key = 'r';
                break;

            case COLOR.GREEN:
                this.key = 'g';
                break;

            case COLOR.BLUE:
                this.key = 'b';
                break;

            case COLOR.YELLOW:
                this.key = 'y';
                break;
            default:
                this.key = '';
                break;
        }
    }

    get colorName(): string {
        switch (this.color) {
            case COLOR.RED:
                return 'danger';

            case COLOR.GREEN:
                return 'success';

            case COLOR.BLUE:
                return 'primary';

            case COLOR.YELLOW:
                return 'warning';

            default:
                return ''
        }
    }

    // getColorNameById(colorID: number): string {
    //     switch (colorID) {
    //         case COLOR.RED:
    //             return 'danger';

    //         case COLOR.GREEN:
    //             return 'success';

    //         case COLOR.BLUE:
    //             return 'primary';

    //         case COLOR.YELLOW:
    //             return 'warning';

    //         default:
    //             return ''
    //     }
    // }
}

export { Bubble };