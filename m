From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] X startup failure
Date: Tue, 27 Dec 2005 08:29:31 +0100
Message-ID: <200512270829.31463.deller@gmx.de>
References: <200512262134.jBQLYo4v018267@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200512262134.jBQLYo4v018267@hiauly1.hia.nrc.ca>
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

On Monday 26 December 2005 22:34, John David Anglin wrote:
> X no longer starts on my c3k using unstable.  The problem seems
> to be:
> 
> (EE) FBDEV(0): FBIOPAN_DISPLAY: Invalid argument
> 
> XF86Config-4 hasn't changed for at least a year.  Any ideas?

I assume your screen resolution changed. 
Maybe new monitor/setup or different graphic card is detected first ?
Try fbset to get the current screen resolution.

Helge
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
