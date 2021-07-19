'use strict';

exports.__esModule = true;

var _react = require('react');

var _react2 = _interopRequireDefault(_react);

var _PlayPauseBtn = require('./PlayPauseBtn');

var _PlayPauseBtn2 = _interopRequireDefault(_PlayPauseBtn);

var _TimeCounter = require('./TimeCounter');

var _TimeCounter2 = _interopRequireDefault(_TimeCounter);

var _ProgressBar = require('./ProgressBar');

var _ProgressBar2 = _interopRequireDefault(_ProgressBar);

var _MuteUnMuteBtn = require('./MuteUnMuteBtn');

var _MuteUnMuteBtn2 = _interopRequireDefault(_MuteUnMuteBtn);

var _VolumeBar = require('./VolumeBar');

var _VolumeBar2 = _interopRequireDefault(_VolumeBar);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _possibleConstructorReturn(self, call) { if (!self) { throw new ReferenceError("this hasn't been initialised - super() hasn't been called"); } return call && (typeof call === "object" || typeof call === "function") ? call : self; }

function _inherits(subClass, superClass) { if (typeof superClass !== "function" && superClass !== null) { throw new TypeError("Super expression must either be null or a function, not " + typeof superClass); } subClass.prototype = Object.create(superClass && superClass.prototype, { constructor: { value: subClass, enumerable: false, writable: true, configurable: true } }); if (superClass) Object.setPrototypeOf ? Object.setPrototypeOf(subClass, superClass) : subClass.__proto__ = superClass; }

var Bar = function (_Component) {
    _inherits(Bar, _Component);

    function Bar() {
        _classCallCheck(this, Bar);

        return _possibleConstructorReturn(this, _Component.apply(this, arguments));
    }

    Bar.prototype.render = function render() {
        return _react2.default.createElement(
            'div',
            { style: this.props.styles.barContainer },
            _react2.default.createElement(_PlayPauseBtn2.default, {
                video: this.props.video,
                styles: this.props.styles
            }),
            _react2.default.createElement(_TimeCounter2.default, {
                video: this.props.video,
                styles: this.props.styles
            }),
            _react2.default.createElement(_ProgressBar2.default, {
                video: this.props.video,
                styles: this.props.styles
            }),
            _react2.default.createElement(_MuteUnMuteBtn2.default, {
                video: this.props.video,
                styles: this.props.styles
            }),
            _react2.default.createElement(_VolumeBar2.default, {
                video: this.props.video,
                styles: this.props.styles
            })
        );
    };

    return Bar;
}(_react.Component);

exports.default = Bar;
module.exports = exports['default'];