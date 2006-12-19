From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] killing a set of user processes causes system
Date: Tue, 19 Dec 2006 20:45:46 +0100
Message-ID: <200612192045.46789.deller__40036.9872608737$1416624236$gmane$org@gmx.de>
References: <200612182017.kBIKHcQB011373@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: parisc-linux@lists.parisc-linux.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200612182017.kBIKHcQB011373@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hi Dave,

On Monday 18 December 2006 21:17, John David Anglin wrote:
> > this is an updated patch, where only the absolute necessary pieces were changed.
> 
> The patch doesn't help.  Still getting hung java processes.

I just committed the final working patch to the parisc git-tree:
http://git.parisc-linux.org/?p=linux-2.6.git;a=commitdiff;h=0590a4f2beee1d489050cb0ca035294892a46a40
The old patch didn't catched all syscalls and cases, e.g. all string-ops weren't handled.
Maybe you could git-pull and try again ?

Helge

PS: Many thanks to Willy who helped me finding the real fix!
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
