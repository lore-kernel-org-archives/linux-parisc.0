From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] PPPOE with BL180
Date: Sun, 09 Jan 2005 18:18:21 -0600
Message-ID: <1105316302.19504.1.camel@mulgrave>
References: <BAY21-F174616CDCA2C6E4FFCB76892960@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
To: Dany Joly <dany_joly@hotmail.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <BAY21-F174616CDCA2C6E4FFCB76892960@phx.gbl>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, 2005-01-09 at 23:00 +0000, Dany Joly wrote:
> Nov  9 03:16:34 mammoth pppd[392]: Using interface ppp0
> Nov  9 03:16:34 mammoth pppd[392]: Connect: ppp0 <--> /dev/pts/0
> Nov  9 03:16:34 mammoth pppd[392]: read: Resource temporarily unavailable
> Nov  9 03:16:34 mammoth pppd[392]: read /dev/ppp: Resource temporarily 
> unavailable

I think this should be fixed (at least in the latest sarge version).
pppd used to do this because EAGAIN and EWOULDBLOCK have different error
numbers on pa (and pppd was originally only checking for one).

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
