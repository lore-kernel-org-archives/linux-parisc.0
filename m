From: "Michael S. Zick" <mszick@wolfbutter.com>
Subject: [parisc-linux] Re: prezeroing patch test against 2.6.11-rc2-pa0
Date: Sun, 23 Jan 2005 08:36:25 -0600
Message-ID: <200501230836.26024.mszick@wolfbutter.com>
References: <41DE941B00001965@mail-6-bnl.tiscali.it>
	<41F2E78B.5070908@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-2022-jp"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <41F2E78B.5070908@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat January 22 2005 17:53, Joel Soete wrote:
> Just an update to mentioned that the last Christoph's patch against our 2.6.11-rc2-pa0 (with some small ack) boot fine on my c110:
> # ps -ef | grep scr
> root        10     1  0 00:38 ?        00:00:04 [kscrubd0]
>   :-)
>
Joel,
That sounds good.  I haven't been watching for newer patches.

I have been working on my patch de-mangler.

It has been slow going because I have never used Lua before.
I have had it on my to-do list of things to learn for several years.

I started out just to correct indentation whitespace...

Now it also reformats bad hunk headers 
and re-writes incorrect hunk headers.

Both with informative messages to the user.  None of that:
"Malformed patch" and exit.  
Which is what the patch program does.

I have a couple more small changes to make, but it is working
pretty well now.

Given a 643,000+ line patchfile (21 Mbyte) it takes about 
10 seconds to re-write it.
With a reasonable sized patchfile, you can't even notice
it's run time.

So it has been fun, even if we don't need it for Christoph's
old patchfiles.

Mike
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
