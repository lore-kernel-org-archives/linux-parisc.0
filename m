Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from web12506.mail.yahoo.com (web12506.mail.yahoo.com [216.136.173.198])
	by dsl2.external.hp.com (Postfix) with SMTP id 2262848A8
	for <parisc-linux@lists.parisc-linux.org>; Thu, 25 Sep 2003 09:41:38 -0600 (MDT)
Message-ID: <20030925154137.8595.qmail@web12506.mail.yahoo.com>
Date: Thu, 25 Sep 2003 08:41:37 -0700 (PDT)
From: Derek Engelhaupt <derekengelhaupt@rocketmail.com>
Subject: Re: [parisc-linux] N Class SMP pb ?  (follow up)
To: parisc-linux@lists.parisc-linux.org
In-Reply-To: <3F5CC41F00008D27@ocpmta3.freegates.net>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-1431430270-1064504497=:7659"
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

--0-1431430270-1064504497=:7659
Content-Type: text/plain; charset=us-ascii

They are in the right slots...N Class CPU loading in order: 1,3,5,7,0,2,4,6.  If you are looking at the back of the machine with the rear cover open, the two cpus should be in the left two slot.  First memory carrier should be in the right most slot and loaded toward the left.  I should know since I just had to tear apart an entire N to upgrade it from 6 550Mhz cpus to 8 750Mhz cpus.  Takes about 3 hours and it requires a system board change.  The N has 3 system boards: an A, a B, and a C rev.  "A" is for 360-440.  "B" is for 360-550.  And the "C" is for the 650-750, but I'm sure it would accept all the processors slower than 650 too with the right speed setting on the dip switches.
 
derek


Joel Soete <soete.joel@tiscali.be> wrote:
Hi all,

Trying to continue investigation, I puted a printk at the begining of handle_interruption()
to get just the interruption's 'code' managed.

As already mentionned in previous mail that I could read many 6, 15 (but
it seems to be normal: e
en in UP kernel those interruption occurs) but
(most interesting) it is the very first time that I got the message making
failled the kernel:
[...]
handle_interruption(26, ...).
SMP CALL FUNCTION TIMED OUT (CPU=1)
handle_interruption(26, ...).



Stack dump:

[...]

(unfortunately I couldn't grab this dump :( )

Could this be a pb with sync between cpu time ref? (because timeout = jiffies
+ HZ)

I have also a look for where this function is called but never see its return
code tested to launch a 'stack dump' and a stop of system?

Thanks in advance for help,
Joel

PS: I don't know if it is important but the two cpus on this server are located
in slot 1 and 3 (not in slot 1 and 2 as we would logicaly expect) 



-------------------------------------------------------------------------
L'Internet rapide, c'est pour tout le monde. Tiscali ADSL, 19,50 Euro
pendant 3 mois! http://reg.tiscali.be/default.asp?lg=fr 


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux


---------------------------------
Do you Yahoo!?
The New Yahoo! Shopping - with improved product search
--0-1431430270-1064504497=:7659
Content-Type: text/html; charset=us-ascii

<DIV>
<DIV>They are in the right slots...N Class CPU loading in order: 1,3,5,7,0,2,4,6.&nbsp; If you are looking at the back of the machine with the rear cover open, the two cpus should be in the left two slot.&nbsp; First memory carrier should be in the right most slot and loaded toward the left.&nbsp; I should know since I just had to tear apart an entire N to upgrade it from 6 550Mhz cpus to 8 750Mhz cpus.&nbsp; Takes about 3 hours and it requires&nbsp;a system board change.&nbsp; The N has 3 system boards: an A, a B, and a C rev.&nbsp; "A" is for 360-440.&nbsp; "B" is for 360-550.&nbsp; And the "C" is for the 650-750, but I'm sure it would accept all the processors slower than 650 too with the right speed setting on the dip switches.</DIV>
<DIV>&nbsp;</DIV>
<DIV>derek<BR><BR><BR><B><I>Joel Soete &lt;soete.joel@tiscali.be&gt;</I></B> wrote:</DIV>
<BLOCKQUOTE class=replbq style="PADDING-LEFT: 5px; MARGIN-LEFT: 5px; BORDER-LEFT: #1010ff 2px solid">Hi all,<BR><BR>Trying to continue investigation, I puted a printk at the begining of handle_interruption()<BR>to get just the interruption's 'code' managed.<BR><BR>As already mentionned in previous mail that I could read many 6, 15 (but<BR>it seems to be normal: e<BR>en in UP kernel those interruption occurs) but<BR>(most interesting) it is the very first time that I got the message making<BR>failled the kernel:<BR>[...]<BR>handle_interruption(26, ...).<BR>SMP CALL FUNCTION TIMED OUT (CPU=1)<BR>handle_interruption(26, ...).<BR><BR><BR><BR>Stack dump:<BR><BR>[...]<BR><BR>(unfortunately I couldn't grab this dump :( )<BR><BR>Could this be a pb with sync between cpu time ref? (because timeout = jiffies<BR>+ HZ)<BR><BR>I have also a look for where this function is called but never see its return<BR>code tested to launch a 'stack dump' and a stop of system?<BR><BR>Thanks in advance for
 help,<BR>Joel<BR><BR>PS: I don't know if it is important but the two cpus on this server are located<BR>in slot 1 and 3 (not in slot 1 and 2 as we would logicaly expect) <BR><BR><BR><BR>-------------------------------------------------------------------------<BR>L'Internet rapide, c'est pour tout le monde. Tiscali ADSL, 19,50 Euro<BR>pendant 3 mois! http://reg.tiscali.be/default.asp?lg=fr <BR><BR><BR>_______________________________________________<BR>parisc-linux mailing list<BR>parisc-linux@lists.parisc-linux.org<BR>http://lists.parisc-linux.org/mailman/listinfo/parisc-linux</BLOCKQUOTE></DIV><p><hr SIZE=1>
Do you Yahoo!?<br>
<a href="http://shopping.yahoo.com/?__yltc=s%3A150000443%2Cd%3A22708228%2Cslk%3Atext%2Csec%3Amail">The New Yahoo! Shopping</a> - with improved product search
--0-1431430270-1064504497=:7659--
