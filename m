From: Guy Martin <gmsoft@tuxicoman.be>
Subject: GCC incorect branching bug
Date: Sun, 30 Dec 2007 23:08:20 +0100
Message-ID: <20071230230820.637c0c3a@bleh.bxl.tuxicoman.be>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_CGxbRhnRf/PSlSpOxq9NTqr"
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--MP_CGxbRhnRf/PSlSpOxq9NTqr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline



Hello all,

It seems that current gcc suffers from a branching bug.
Please see http://bugs.gentoo.org/show_bug.cgi?id=203543 for the full
bug details.

As stated in the bug details, simply compile the attached test case
with different optimisation levels and the result will differ.

This seems to be happening for gcc-4.1.2 up to the latest 4.3.

Gentoo's gcc includes the latest cbranch patches found in the debian
one. Let me know if more info is needed.

Regards,
  Guy


-- 
Guy Martin
Gentoo Linux - HPPA port lead

--MP_CGxbRhnRf/PSlSpOxq9NTqr
Content-Type: text/x-csrc; name=test-branching-bug.c
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=test-branching-bug.c


int ret1() { return -1; }

int main(int argc, char **argv) {
        int i = ret1();
        if(i >= -10000) { i = -i; } // should execute
        return i+10;
}

--MP_CGxbRhnRf/PSlSpOxq9NTqr--
