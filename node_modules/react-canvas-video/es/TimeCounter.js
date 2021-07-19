function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _possibleConstructorReturn(self, call) { if (!self) { throw new ReferenceError("this hasn't been initialised - super() hasn't been called"); } return call && (typeof call === "object" || typeof call === "function") ? call : self; }

function _inherits(subClass, superClass) { if (typeof superClass !== "function" && superClass !== null) { throw new TypeError("Super expression must either be null or a function, not " + typeof superClass); } subClass.prototype = Object.create(superClass && superClass.prototype, { constructor: { value: subClass, enumerable: false, writable: true, configurable: true } }); if (superClass) Object.setPrototypeOf ? Object.setPrototypeOf(subClass, superClass) : subClass.__proto__ = superClass; }

import React, { Component } from 'react';

var TimeCounter = function (_Component) {
    _inherits(TimeCounter, _Component);

    function TimeCounter() {
        var _temp, _this, _ret;

        _classCallCheck(this, TimeCounter);

        for (var _len = arguments.length, args = Array(_len), _key = 0; _key < _len; _key++) {
            args[_key] = arguments[_key];
        }

        return _ret = (_temp = (_this = _possibleConstructorReturn(this, _Component.call.apply(_Component, [this].concat(args))), _this), _this.timeUpdateListener = function () {
            return _this.forceUpdate();
        }, _this.secondsToHms = function (seconds) {
            seconds = Number(seconds);
            if (!seconds) return '00:00:00';

            var h = Math.floor(seconds / 3600);
            var m = Math.floor(seconds % 3600 / 60);
            var s = Math.floor(seconds % 3600 % 60);

            return (h < 10 ? '0' + h : h) + ':' + (m < 10 ? '0' + m : m) + ':' + (s < 10 ? '0' + s : s);
        }, _temp), _possibleConstructorReturn(_this, _ret);
    }

    TimeCounter.prototype.componentDidMount = function componentDidMount() {
        this.props.video.addEventListener('timeupdate', this.timeUpdateListener, false);
    };

    TimeCounter.prototype.componentWillUnmount = function componentWillUnmount() {
        this.props.video.removeEventListener('timeupdate', this.timeUpdateListener, false);
    };

    TimeCounter.prototype.render = function render() {
        var _props = this.props,
            video = _props.video,
            style = _props.styles;


        return React.createElement(
            'div',
            { style: style.time },
            this.secondsToHms(video.currentTime),
            '/',
            this.secondsToHms(video.duration)
        );
    };

    return TimeCounter;
}(Component);

export default TimeCounter;