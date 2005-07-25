From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] PA 2.0 float conversion to unsigned long long
Date: Mon, 25 Jul 2005 11:57:36 +0200
Message-ID: <IK6H00$910131208EE75A1A8B3FE51EFCB8D16A@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
Cc: kyle <kyle@mcmartin.ca>,
 dave <dave@hiauly1.hia.nrc.ca>,
 parisc-linux <parisc-linux@lists.parisc-linux.org>,
 tsg45800 <tsg45800@scarlet.be>
To: "grundler" <grundler@parisc-linux.org>
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

> On Sat, Jul 23, 2005 at 09:39:34AM +0000, Joel Soete wrote:
> > >I'm not sure it's a very good idea posting bits of the HP-UX
> > >kernel on a publicly archived mailing list. I imagine the disassembl=
y's
> > >legal status is questionable... 
> >
> > Yes I hesitate but finaly though that reverse engineering is legal (s=
ee the 
> > famous samba project ;-) )?
> 
> samba didn't disassemble a copy of the binary.
> They reverse engineered the "on wire" protocol as captured by tcpdump.
> 
(mmm is boomerang <http://boomerang.sourceforge.net/> a more relevant exa=
mple
:-? )
That said, my worry was not much the way reverse engineering was realised=
 then
reverse-engineering by itself: is it or not legal?
 
> Dumping raw dissassembly isn't interesting.
More over ;-)(absolutely agree with you)

Anyway may I come back shortly to the original object of this thread:
"PA 2.0 float conversion to unsigned long long"

I reach to reproduce the pb clearly decribe by jda and with the help of g=
db I
observed not only a difference of results between p-l and hpux-11.00 but =
also
a noticable difference of behaviour in fpsr.

The differences make me ask if "fpu is configurable?"

On irc Carlos put me another question on the fpu mode which make me disco=
ver
in parisc2.0.pdf ("PA-RISC 2.0 Architecture Floating-Point Instruction Se=
t
9-9") a documented way to (at least) indentify pfu.

Btw I discover:
    o this chunk wasn't implemented in p-l but well hpux-11.00 (32 and 64=
bit).

    o hpux (11-.00) has also a label which make thought
      that fpu have actualy to be initialized

    o this thread
<http://lists.parisc-linux.org/pipermail/parisc-linux/2003-January/018852=
.html>
      (my grasp of this code is not yet complete sorry: 
            when/where fpregs[] was setup? ...)

Are we missing something?

> If it is legal in your country to analyze the behaviors, I'm
> really only interested in the analysis.
> 
(In a help desk, I read this joke: ... for miracle we ask you a delay of =
24h :-)

Thanks again,
    Joel=0A=0A-------------------------------------------------------=0AN=
OTE! My email address is changing to ... @scarlet.be=0APlease make the ne=
cessary changes in your address book. =0A=0A

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
