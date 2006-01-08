From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: [parisc-linux] Re: [RFC] Updated glibc 2.3.5-8.1
Date: Sun, 8 Jan 2006 14:13:03 -0500 (EST)
Message-ID: <200601081913.k08JD3sF024876@hiauly1.hia.nrc.ca>
References: <200601081903.k08J3Wvh024822@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: carlos@systemhalted.org,
 parisc-linux@lists.parisc-linux.org,
 tausq@debian.org
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200601081903.k08J3Wvh024822@hiauly1.hia.nrc.ca> from "John David
	Anglin" at Jan 8, 2006 02:03:31 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> in fr22 until after the SIGFPE.  It sort of looks like the exception
> must be in __ieee754_acos.

Take that back.  The function calls feholdexcept (envp=0xc04fba68)
and then fesetround (round=0) before the arithmetic exception.

(gdb) p/x *envp
$2 = {__status_word = 0x1, __exception = {0x40000360, 0x1, 0x40000360,
    0x4033af90, 0x4084c6b8, 0x4084c6b8, 0x0}}

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
