From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: [parisc-linux] who?
Date: Sat, 19 Jun 2004 22:04:06 -0400 (EDT)
Message-ID: <200406200204.i5K246dC007504@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
To: parisc-linux@lists.parisc-linux.org
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

I've noticed that "who" is essentially useless in reporting users who
are actually logged in.  There seems to be a rather poor cleanup when
connections die and a user doesn't logout.

dave@gsyprf11:~$ w
 18:58:55 up 17 days,  2:38, 99 users,  load average: 1.61, 1.42, 1.31
USER     TTY      FROM              LOGIN@   IDLE   JCPU   PCPU WHAT
dave     pts/2595 hse-ottawa-ppp23 08:46    4:25m  2:17  10.75s less build2.log
dave     pts/2595 hse-ottawa-ppp23 10:34    0.00s  0.34s  0.03s w
dave@gsyprf11:~$ who
carlos   pts/24748    Jun  3 13:27 (ip47-168.ott.istop.com)
dave     pts/24749    Jun  3 21:44 (hse-ottawa-ppp235823.sympatico.ca)
grundler pts/24750    Jun  3 21:53 (c-24-6-53-189.client.comcast.net)
carlos   pts/24751    Jun  4 09:12 (ip47-168.ott.istop.com)
carlos   pts/24755    Jun  4 11:11 (ip47-168.ott.istop.com)
tausq    pts/24756    Jun  4 11:20 (gandalf.tausq.org)
carlos   pts/24757    Jun  4 14:40 (ip47-168.ott.istop.com)
grundler pts/24758    Jun  4 16:37 (c-24-6-53-189.client.comcast.net)
grundler pts/24759    Jun  4 19:02 (c-24-6-53-189.client.comcast.net)
dave     pts/24760    Jun  4 21:13 (hse-ottawa-ppp234817.sympatico.ca)
...

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
