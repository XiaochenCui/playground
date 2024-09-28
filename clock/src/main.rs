use std::{
    thread,
    time::{Duration, Instant, SystemTime},
};

use time::{format_description, OffsetDateTime};

pub fn main() {
    let mut prev_wall = SystemTime::now();
    let mut prev_monotonic = Instant::now();

    let format =
        format_description::parse("[year]-[month]-[day]T[hour]:[minute]:[second].[subsecond digits:9][offset_hour]:[offset_minute]")
            .expect("Failed to parse format description");

    loop {
        thread::sleep(Duration::from_secs(1));

        let wall = SystemTime::now();
        let monotonic = Instant::now();

        let monotonic_diff = monotonic.duration_since(prev_monotonic);
        // The monotonic clock is monotonically increasing by 1 second.
        assert!((monotonic_diff.as_secs_f64() - 1.0).abs() < 0.1);

        let wall_str = Into::<OffsetDateTime>::into(wall)
            .format(&format)
            .expect("Failed to format wall time");
        println!("wall time: {}", wall_str);

        let d = duration(prev_wall, wall);
        if d < 0.0 {
            let prev_wall_str = Into::<OffsetDateTime>::into(prev_wall)
                .format(&format)
                .expect("Failed to format wall time");
            println!(
                "wall clock skew detected, current wall time ({}) is earlier than previous wall time ({}) by {} seconds",
                wall_str,
                prev_wall_str,
                -d,
            );

            println!(
                "monotonic clock doesn't affectted, current monotonic time is {} seconds later than previous monotonic time",
                monotonic_diff.as_secs_f64(),
            );
            break;
        }

        prev_wall = wall;
        prev_monotonic = monotonic;
    }
}

/// Returns the duration between two `SystemTime` instances in seconds. The
/// return value will be negative if `from` is later than `to`.
fn duration(from: SystemTime, to: SystemTime) -> f64 {
    if from > to {
        return -duration(to, from);
    }

    return to
        .duration_since(from)
        .expect("SystemTime duration overflowed")
        .as_secs_f64();
}
