From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] who?
Date: Sun, 20 Jun 2004 12:23:46 -0600
Message-ID: <20040620182346.GC30899@colo.lackof.org>
References: <200406200204.i5K246dC007504@hiauly1.hia.nrc.ca>
	<20040620072007.GB18353@colo.lackof.org>
	<20040620133854.GQ20511@parcelfarce.linux.theplanet.co.uk>
	<1087739975.11000.18.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
To: James Bottomley <James.Bottomley@steeleye.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1087739975.11000.18.camel@mulgrave>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Jun 20, 2004 at 08:59:32AM -0500, James Bottomley wrote:
> If you're going to investigate, my bet would be on the new pts
> behaviour.  I bet the utmp/wtmp utilities haven't met pts numbers going
> up that high before.

probably. "last" shows all the entries and "who" only shows
the entries up to the points pts numbers get small again:

grundler <531>last
grundler pts/284525   c-24-6-53-189.cl Sun Jun 20 10:54   still logged in   
grundler pts/284524   c-24-6-53-189.cl Sun Jun 20 10:49   still logged in   
dave     pts/283794   hse-ottawa-ppp23 Sun Jun 20 08:49    gone - no logout 
grundler pts/283793   c-24-6-53-189.cl Sat Jun 19 23:21    gone - no logout 
...
dave     pts/24749    hse-ottawa-ppp23 Thu Jun  3 21:44    gone - no logout 
carlos   pts/24748    ip47-168.ott.ist Thu Jun  3 13:27    gone - no logout 
grundler pts/5        c-24-6-53-189.cl Wed Jun  2 22:12 - 22:14  (00:02)    
grundler pts/4        c-24-6-53-189.cl Wed Jun  2 20:55 - 22:10  (01:15)    
...
reboot   system boot  2.6.6-pa4        Wed Jun  2 16:52         (17+18:17)  
grundler pts/233985   c-24-6-53-189.cl Tue Jun  1 21:24 - crash  (19:28)    
dave     pts/212624   hiauly1.hia.nrc. Tue Jun  1 14:57 - crash (1+01:54)   

wtmp begins Tue Jun  1 14:57:53 2004
grundler <532>who
carlos   pts/24748    Jun  3 13:27 (ip47-168.ott.istop.com)
dave     pts/24749    Jun  3 21:44 (hse-ottawa-ppp235823.sympatico.ca)
grundler pts/24750    Jun  3 21:53 (c-24-6-53-189.client.comcast.net)
...


The "no logout" message is another clue.
Either last is having problems with that or whoever writes the utmp/wtmp
entries does.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
