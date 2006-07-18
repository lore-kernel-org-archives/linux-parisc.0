From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [parisc-linux] Re: A warning about NPTL pthreaddefs.h
Date: Tue, 18 Jul 2006 10:01:35 -0400
Message-ID: <119aab440607180701t27a3443bv8628574815636085@mail.gmail.com>
References: <119aab440607171537p25d0350he9aa937c439c428a@mail.gmail.com>
	<44BC2900.4030303@tausq.org> <20060718101242.GA12796@titanium.v3.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "Jeff Bailey" <jbailey@raspberryginger.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060718101242.GA12796@titanium.v3.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 7/18/06, Jeff Bailey <jbailey@raspberryginger.com> wrote:
> On other platforms, LT binaries generally run on the NPTL libs.  If we
> break this, then there'll be an interesting upgrade problem for the
> distros tosolve that they haven't needed to do on other archs.

It's technically possible... maybe...

1. Use 1 for locked, and 0 for unlocked in our integer sized locks (to match LT)
2. Add padding in the form of a union, aligned to 16.
3. Select the aligned lock word, but use CAS instead of LDCW.

This would give the same semantics as LT, and probably preserve binary
compatiblity. The only performance loss is calculated the aligned
word.

c.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
