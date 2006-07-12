From: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] Uninterruptible sleep
Date: Wed, 12 Jul 2006 13:19:01 +0800
Message-ID: <44B48645.1010203@tausq.org>
References: <200607120227.k6C2ROZg023482@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200607120227.k6C2ROZg023482@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

John David Anglin wrote:
>   PID USER      PR  NI  VIRT  RES  SHR S %CPU %MEM    TIME+  COMMAND
> 
>   17958 dave      16   0     0    0    0 D  0.0  0.0   0:00.00 Process_5.exe
>   18055 dave      15   0     0    0    0 D  0.0  0.0   0:00.02 Process_6.exe
> 
> Anybody got any ideas how processes can end up sleeping forever?  The
> above two processes have been sleeping for more than a day.  This is
> a 32-bit kernel 2.6.17-rc3-pa3.

can you try doing a sysrq-t and see where they are stuck? This is most
easily done on a serial console by sending a break, and then 't'. If you
are telneting to a GSP console you can escape out to the telnet prompt
and type "send break".

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
