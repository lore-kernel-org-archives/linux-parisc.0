From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] [PATCH] [PARISC] Clean up syslog output of
Date: Sun, 15 Jul 2007 20:19:07 +0200
Message-ID: <200707152019.08212.deller__26793.3378382169$1416624414$gmane$org@gmx.de>
References: <200707151521.l6FFLnsn007217@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: parisc-linux@lists.parisc-linux.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200707151521.l6FFLnsn007217@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sunday 15 July 2007, John David Anglin wrote:
> > Also, you might want to remove "segfault" from the output string, since
> > the crash can be from SIGSEGV, SIGILL, SIGBUS, etc...
> 
> Why not print the actual name of the interruption from the arch
> instead of "code 15", etc?

I'll take a look at that.

Helge
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
