class Utils {
    static randomInt(max: number): number {
        return Math.floor(Math.random() * (max + 1));
    }

    static delay(ms: number) {
        return new Promise(resolve => setTimeout(resolve, ms));
    }

}
export { Utils };