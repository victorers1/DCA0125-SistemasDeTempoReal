import React, { Component } from 'react';

interface Letter {
    content: string,
    isCorrect?: boolean
}

interface Props {
    letters: Letter[]
}

export default class LetterRow extends Component<Props> {
    render() {
        var { letters } = this.props;


        return <>
            <h4>{letters[0].content.toUpperCase()}</h4>
            <h1>{letters[1].content.toUpperCase()}</h1>
            <h4>{letters[2].content.toUpperCase()}</h4>
        </>
    }


}
