use raft_adapters::sub;
use raft_core::add;

fn main() {
    println!("Hello raft-local");
    println!("1 + 2 = {}", add(1, 2));
    println!("3 - 1 = {}", sub(3, 1));
}
