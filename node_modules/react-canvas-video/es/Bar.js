function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _possibleConstructorReturn(self, call) { if (!self) { throw new ReferenceError("this hasn't been initialised - super() hasn't been called"); } return call && (typeof call === "object" || typeof call === "function") ? call : self; }

function _inherits(subClass, superClass) { if (typeof superClass !== "function" && superClass !== null) { throw new TypeError("Super expression must either be null or a function, not " + typeof superClass); } subClass.prototype = Object.create(superClass && superClass.prototype, { constructor: { value: subClass, enumerable: false, writable: true, configurable: true } }); if (superClass) Object.setPrototypeOf ? Object.setPrototypeOf(subClass, superClass) : subClass.__proto__ = superClass; }

import React, { Component } from 'react';

import PlayPauseBtn from './PlayPauseBtn';
import TimeCounter from './TimeCounter';
import ProgressBar from './ProgressBar';
import MuteUnMuteBtn from './MuteUnMuteBtn';
import VolumeBar from './VolumeBar';

var Bar = function (_Component) {
    _inherits(Bar, _Component);

    function Bar() {
        _classCallCheck(this, Bar);

        return _possibleConstructorReturn(this, _Component.apply(this, arguments));
    }

    Bar.prototype.render = function render() {
        return React.createElement(
            'div',
            { style: this.props.styles.barContainer },
            React.createElement(PlayPauseBtn, {
                video: this.props.video,
                styles: this.props.styles
            }),
            React.createElement(TimeCounter, {
                video: this.props.video,
                styles: this.props.styles
            }),
            React.createElement(ProgressBar, {
                video: this.props.video,
                styles: this.props.styles
            }),
            React.createElement(MuteUnMuteBtn, {
                video: this.props.video,
                styles: this.props.styles
            }),
            React.createElement(VolumeBar, {
                video: this.props.video,
                styles: this.props.styles
            })
        );
    };

    return Bar;
}(Component);

export default Bar;