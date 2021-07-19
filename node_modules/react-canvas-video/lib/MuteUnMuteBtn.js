'use strict';

exports.__esModule = true;

var _react = require('react');

var _react2 = _interopRequireDefault(_react);

var _icons = require('./icons');

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _possibleConstructorReturn(self, call) { if (!self) { throw new ReferenceError("this hasn't been initialised - super() hasn't been called"); } return call && (typeof call === "object" || typeof call === "function") ? call : self; }

function _inherits(subClass, superClass) { if (typeof superClass !== "function" && superClass !== null) { throw new TypeError("Super expression must either be null or a function, not " + typeof superClass); } subClass.prototype = Object.create(superClass && superClass.prototype, { constructor: { value: subClass, enumerable: false, writable: true, configurable: true } }); if (superClass) Object.setPrototypeOf ? Object.setPrototypeOf(subClass, superClass) : subClass.__proto__ = superClass; }

var MuteUnMuteBtn = function (_Component) {
    _inherits(MuteUnMuteBtn, _Component);

    function MuteUnMuteBtn() {
        var _temp, _this, _ret;

        _classCallCheck(this, MuteUnMuteBtn);

        for (var _len = arguments.length, args = Array(_len), _key = 0; _key < _len; _key++) {
            args[_key] = arguments[_key];
        }

        return _ret = (_temp = (_this = _possibleConstructorReturn(this, _Component.call.apply(_Component, [this].concat(args))), _this), _this.muteUnMuteHandler = function (e, video) {
            video.muted = !video.muted;
            _this.forceUpdate();
        }, _temp), _possibleConstructorReturn(_this, _ret);
    }

    MuteUnMuteBtn.prototype.render = function render() {
        var _this2 = this;

        var _props = this.props,
            video = _props.video,
            style = _props.styles;


        return _react2.default.createElement(
            'div',
            {
                onClick: function onClick(e) {
                    return _this2.muteUnMuteHandler(e, video);
                },
                style: style.button
            },
            video.muted ? _react2.default.createElement(_icons.UnMuteIcon, { style: style.buttonIcon }) : _react2.default.createElement(_icons.MuteIcon, { style: style.buttonIcon })
        );
    };

    return MuteUnMuteBtn;
}(_react.Component);

exports.default = MuteUnMuteBtn;
module.exports = exports['default'];