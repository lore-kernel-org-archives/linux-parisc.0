From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: [parisc-linux] A warning about NPTL pthreaddefs.h
Date: Mon, 17 Jul 2006 18:37:58 -0400
Message-ID: <119aab440607171537p25d0350he9aa937c439c428a@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
To: parisc-linux <parisc-linux@lists.parisc-linux.org>,
 "Randolph Chung" <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Randolph,

A warning that the pthreaddefs.h might be horribly wrong. I remember a
long while ago adding padding the structures so they matched the size
of the linuxthread types (atleast the lock position).

This padding is not correct, we would need to pull into our tree the
static mutex initializers so they are correctly sized aswell.

If you look at the build logs there are warnings about this.

I'm trying a build with the lock padding removed, but it still fails
all over the place, but atleast this time there are no apparent
deadlocks!!! Yay!

Cheers,
Carlos.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
