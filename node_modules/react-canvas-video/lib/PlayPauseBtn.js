'use strict';

exports.__esModule = true;

var _react = require('react');

var _react2 = _interopRequireDefault(_react);

var _icons = require('./icons');

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _possibleConstructorReturn(self, call) { if (!self) { throw new ReferenceError("this hasn't been initialised - super() hasn't been called"); } return call && (typeof call === "object" || typeof call === "function") ? call : self; }

function _inherits(subClass, superClass) { if (typeof superClass !== "function" && superClass !== null) { throw new TypeError("Super expression must either be null or a function, not " + typeof superClass); } subClass.prototype = Object.create(superClass && superClass.prototype, { constructor: { value: subClass, enumerable: false, writable: true, configurable: true } }); if (superClass) Object.setPrototypeOf ? Object.setPrototypeOf(subClass, superClass) : subClass.__proto__ = superClass; }

var PlayPauseBtn = function (_Component) {
    _inherits(PlayPauseBtn, _Component);

    function PlayPauseBtn() {
        var _temp, _this, _ret;

        _classCallCheck(this, PlayPauseBtn);

        for (var _len = arguments.length, args = Array(_len), _key = 0; _key < _len; _key++) {
            args[_key] = arguments[_key];
        }

        return _ret = (_temp = (_this = _possibleConstructorReturn(this, _Component.call.apply(_Component, [this].concat(args))), _this), _this.playPauseListener = function () {
            return _this.forceUpdate();
        }, _this.onPlayPauseHandler = function (e, video) {
            video.paused ? video.play() : video.pause();
            _this.forceUpdate();
        }, _temp), _possibleConstructorReturn(_this, _ret);
    }

    PlayPauseBtn.prototype.componentDidMount = function componentDidMount() {
        this.props.video.addEventListener('play', this.playPauseListener, false);
        this.props.video.addEventListener('pause', this.playPauseListener, false);
    };

    PlayPauseBtn.prototype.componentWillUnmount = function componentWillUnmount() {
        this.props.video.removeEventListener('play', this.playPauseListener, false);
        this.props.video.removeEventListener('pause', this.playPauseListener, false);
    };

    PlayPauseBtn.prototype.render = function render() {
        var _this2 = this;

        var _props = this.props,
            video = _props.video,
            style = _props.styles;


        return _react2.default.createElement(
            'div',
            {
                onClick: function onClick(e) {
                    return _this2.onPlayPauseHandler(e, video);
                },
                style: style.button
            },
            video.paused ? _react2.default.createElement(_icons.PlayIcon, { style: style.buttonIcon }) : _react2.default.createElement(_icons.PauseIcon, { style: style.buttonIcon })
        );
    };

    return PlayPauseBtn;
}(_react.Component);

exports.default = PlayPauseBtn;
module.exports = exports['default'];