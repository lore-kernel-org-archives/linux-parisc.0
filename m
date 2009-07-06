From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: HPPA and Squeeze
Date: Mon, 6 Jul 2009 12:36:16 -0400
Message-ID: <119aab440907060936x7051933fgfde585df640ca1b1@mail.gmail.com>
References: <4A518DBD.3090209@tausq.org>
	 <20090706132836.B39E6500D@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=001636499603df573f046e0c1aba
Cc: Randolph Chung <randolph@tausq.org>,
	James.Bottomley@hansenpartnership.com, deller@gmx.de,
	kurt@roeckx.be, pkern@debian.org, debian-hppa@lists.debian.org,
	linux-parisc@vger.kernel.org, debian-release@lists.debian.org,
	kyle@mcmartin.ca
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090706132836.B39E6500D@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--001636499603df573f046e0c1aba
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 6, 2009 at 9:28 AM, John David
Anglin<dave@hiauly1.hia.nrc.ca> wrote:
> Not that I am aware of. =A0The situation is essentially the reverse of
> the above. =A0Data is written from a region of memory. =A0Then, in anothe=
r
> instance of gcc, it needs to be mmap'ed back to the same location in
> memory. =A0In theory, it could be brought back to a different location
> but this would require a fairly complex set of relocations.

GCC does not read() and write to the mmap()'d file.

The dynamic loader uses MAP_DENYWRITE to avoid writing into the mmap()'d me=
mory.

I will reiterate my point here that the dynamic linker the first user
of mmap in a newly started process, and the first program to read and
process data from the mmap'd files. Therefore the dynamic linker is
always the first to suffer if a mapped region of memory is not
correct.

What we need to do here is create a test case.

I tried this:

1. cp /lib/libc.so.6 original.so
2. cp /lib/libc.so.6 map.so
3. gcc -O2 -g -o test-mmap test-mmap.c
4. while true; do ./test-mmap ./original.so ./map.so; done;

The test mmap's a file and compares it to the original, aborting if
the comparison fails. I've yet to see it abort on my a500, and I've
run 20-30 instances of the test simultaneously. Then again I don't see
any serious segv's like others do (2.6.26-1-parisc64-smp).

What might be a better testcase?

Cheers,
Carlos.

--001636499603df573f046e0c1aba
Content-Type: text/x-csrc; charset=US-ASCII; name="test-mmap.c"
Content-Disposition: attachment; filename="test-mmap.c"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_fwtewrex0

I2luY2x1ZGUgPHN0ZGlvLmg+CiNpbmNsdWRlIDxzdGRsaWIuaD4KI2luY2x1ZGUgPHN5cy9tbWFu
Lmg+IC8qIG1tYXAgKi8KI2luY2x1ZGUgPHN5cy90eXBlcy5oPiAvKiBvcGVuICovCiNpbmNsdWRl
IDxzeXMvc3RhdC5oPiAvKiBvcGVuICovCiNpbmNsdWRlIDxmY250bC5oPiAvKiBvcGVuICovCiNp
bmNsdWRlIDx1bmlzdGQuaD4gLyogbHNlZWsgKi8KCiNkZWZpbmUgQk1BWCA0MDk2CgppbnQgCm1h
aW4gKGludCBhcmdjLCBjaGFyICoqYXJndikKewogIHZvaWQgKm1hcHByZWY7CiAgaW50IGZkLCBm
ZGM7CiAgb2ZmX3QgbWFwbGVuZ3RoLCBpbmRleCwgajsKICBjaGFyICpvcmlnaW5hbCA9IGFyZ3Zb
MV0sICpjb3B5ID0gYXJndlsyXTsKICBjaGFyIGJ1ZltCTUFYXSwgKm1idWY7CiAgc3NpemVfdCBy
ZXQ7CiAgLyogT3BlbiBvcmlnaW5hbCBmaWxlIHRvIGNvbXB1dGUgc2l6ZS4gV2Ugb3BlbiB0aGUg
b3JpZ2luYWwKICAgICBmaWxlIHRvIHNpbXVsYXRlIGhhdmluZyB0aGUgZmQgb3BlbiBiZWZvcmUg
bW1hcCBhcyB0aGUKICAgICBkeW5hbWljIGxvYWRlciBkb2VzLiAgKi8KICBmZCA9IG9wZW4gKG9y
aWdpbmFsLCBPX1JET05MWSk7CiAgaWYgKGZkID09IC0xKQogICAgewogICAgICBwZXJyb3IgKCJv
cGVuIik7CiAgICAgIGFib3J0ICgpOwogICAgfQogIG1hcGxlbmd0aCA9IGxzZWVrIChmZCwgMCwg
U0VFS19FTkQpOwogIGlmIChmZCA9PSAtMSkKICAgIHsKICAgICAgcGVycm9yICgibHNlZWsiKTsK
ICAgICAgYWJvcnQgKCk7CiAgICB9CiAgLyogTm93IG1tYXAgdGhlIG9wZW4gZmlsZS4gKi8KICBt
YXBwcmVmID0gbW1hcCAoKHZvaWQgKiltYXBwcmVmLCAKCQkgIG1hcGxlbmd0aCwgCgkJICBQUk9U
X1JFQUQgfCBQUk9UX0VYRUMsIAoJCSAgTUFQX1BSSVZBVEUgfCBNQVBfREVOWVdSSVRFIHwgTUFQ
X0ZJTEUsIAoJCSAgZmQsIAoJCSAgMCk7CiAgaWYgKG1hcHByZWYgPT0gKHZvaWQgKiktMSkKICAg
IHsKICAgICAgcGVycm9yICgibW1hcCIpOwogICAgICBhYm9ydCAoKTsKICAgIH0KICBtYnVmID0g
KGNoYXIgKiltYXBwcmVmOwogIC8qIENvbXBhcmUgbW1hcCB0byBjb3B5LiAqLwogIGZkYyA9IG9w
ZW4gKGNvcHksIE9fUkRPTkxZKTsKICBpZiAoZmRjID09IC0xKQogICAgewogICAgICBwZXJyb3Ig
KCJvcGVuICMyIik7CiAgICAgIGFib3J0ICgpOwogICAgfQogIGZvciAoaW5kZXggPSAwOyBpbmRl
eCA8IG1hcGxlbmd0aDsgaW5kZXggKz0gQk1BWCkKICAgIHsKICAgICAgcmV0ID0gcmVhZCAoZmRj
LCAmYnVmWzBdLCBCTUFYKTsKICAgICAgaWYgKChyZXQgIT0gQk1BWCkgJiYgKHJldCA9PSAtMSkp
CiAgICAgICAgewoJICBwZXJyb3IgKCJyZWFkIik7CgkgIGFib3J0ICgpOwogICAgICAgIH0KICAg
ICAgZm9yIChqID0gMDsgKChqIDwgQk1BWCkgJiYgKChpbmRleCArIGopIDwgbWFwbGVuZ3RoKSk7
IGorKykKICAgICAgICB7CgkgIGlmIChtYnVmW2luZGV4ICsgal0gIT0gYnVmW2pdKQoJICAgIHsK
CSAgICAgIGZwcmludGYoc3RkZXJyLCAiTWlzbWF0Y2ggYXQgJWxkLCByZWFkICVkLCBleHBlY3Rl
ZCAlZFxuIiwgCgkJCWluZGV4ICsgaiwgKHVuc2lnbmVkIGludCltYnVmW2luZGV4ICsgal0sICh1
bnNpZ25lZCBpbnQpYnVmW2pdKTsKCSAgICAgIGFib3J0ICgpOwoJICAgIH0KCSAgaWYgKERFQlVH
KQoJICAgIHByaW50ZiAoIk1hdGNoIGF0ICVsZCwgcmVhZCAlZCwgZXhwZWN0ZWQgJWRcbiIsCgkJ
CWluZGV4ICsgaiwgKHVuc2lnbmVkIGludCltYnVmW2luZGV4ICsgal0sICh1bnNpZ25lZCBpbnQp
YnVmW2pdKTsKICAgICAgICB9CiAgICB9CiAgcmV0dXJuIDA7Cn0KCg==
--001636499603df573f046e0c1aba--
