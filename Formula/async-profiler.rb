class AsyncProfiler < Formula
  desc "Sampling CPU and HEAP profiler for Java"
  homepage "https://github.com/jvm-profiling-tools/async-profiler"
  url "https://github.com/jvm-profiling-tools/async-profiler/archive/v1.5.tar.gz"
  sha256 "ffe8281f745a8e55bf9485c9ed9d30e5c4934174275cdb73b32e47cde35fffdd"

  depends_on :java

  def install
    system "make"

    libexec.install "build", "profiler.sh"
    bin.install_symlink libexec/"profiler.sh" => "async-profiler"
  end

  test do
    system bin/"async-profiler", "-v"
  end
end
