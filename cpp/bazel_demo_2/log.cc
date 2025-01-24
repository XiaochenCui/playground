// NB: must define SPDLOG_ACTIVE_LEVEL before `#include "spdlog/spdlog.h"` to
// make "SPDLOG_<LEVEL>" macros work
#define SPDLOG_ACTIVE_LEVEL SPDLOG_LEVEL_TRACE
// fmtlib/fmt has "consteval" error in C++20 and later, use
// "SPDLOG_USE_STD_FORMAT" for C++20 and later
//
// error:
// call to consteval function 'fmt::basic_format_string<...>' is not a constant
// expression
//
// ref:
// https://github.com/fmtlib/fmt/issues/2438
// #define SPDLOG_USE_STD_FORMAT
#include <spdlog/fmt/bin_to_hex.h>  // spdlog::to_hex
#include <spdlog/spdlog.h>

int main() {
    // set level for "spdlog::<level>" functions
    spdlog::set_level(spdlog::level::debug);
    spdlog::set_pattern("[%Y-%m-%d %H:%M:%S.%e] [%l] [%@] %v");

    spdlog::info("Hello, World!");
    spdlog::debug("Hello, World!");

    SPDLOG_INFO("Hello, World!");
    SPDLOG_DEBUG("Hello, World!");

    SPDLOG_DEBUG("Hello, World!, {}", 42);

    {
        // fmt::format("print a number: {}", 13);
        // auto msg = std::format("print a number: {}", 13);
        // SPDLOG_DEBUG("msg: {}", msg);
    }

    // std::vector<char> data = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i',
    // 'j'}; char data[] = { 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j' };
    // auto msg    = spdlog::to_hex(data, data + 3);
    // SPDLOG_DEBUG("hex data: {}", msg);
    // SPDLOG_DEBUG("hex data: {}", spdlog::to_hex(data, data + 3));

    std::vector<char> v(200, 0x0b);
    spdlog::info("Some buffer {}", spdlog::to_hex(v));

    return 0;
}