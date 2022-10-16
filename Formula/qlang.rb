# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Qlang < Formula
    desc "A toy programming language with a mix of R and Python's goodies"
    homepage "https://github.com/qiushiyan/qlang"
    url "https://github.com/qiushiyan/qlang/releases/download/v0.0.1-lw/q-v0.0.1-lw-darwin-amd64.tar.gz"
    sha256 "427b13bc8f2fc963a0bd58d673844e4315667f196207785b67a731de30f088aa"
    license "MIT"

    depends_on "go"

    def install
        ENV["GOPATH"] = buildpath
        ENV["GO111MODULE"] = "on"
        ENV["GOFLAGS"] = "-mod=vendor"
        ENV["PATH"] = "#{ENV["PATH"]}:#{buildpath}/bin"
        (buildpath/"src/github.com/qiushiyan/qlang").install buildpath.children
        cd "src/github.com/qiushiyan/qlang/cmd/q" do
          system "go", "build", "-o", bin/"q", "."
        end
    end

    test do
      system "true"
    end
  end
