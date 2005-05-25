From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] If this is the last message you see
Date: Wed, 25 May 2005 09:20:57 +0200
Message-ID: <42933E2F000003E2@mail-1-bnl.tiscali.it>
References: <42939853.4090706@xtech.com.ar>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
To: "Daniel Coletti" <dcoletti@xtech.com.ar>,
 parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <42939853.4090706@xtech.com.ar>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

[snip]
> > You should not change the console-setting to the kernel, you should 
> > switch cables from serial one to serial 2 at the moment you see the 
> > message. As far as I recall, you have some time to do so before you 
> > start missing boot-messages.
> 
> thanks, that was it ... I did have to change the console=3D parameter
> because it defaults to ttyB0 and does not work (ttyS0 does in the Seria=
l
> port no. 2).
> Now I have problems with term emulation (I have a hp 700/96 terminal),
> nothing a serial cable with minicom can't handle.
> 
mmm (i don't have such device nor user guide near hand so I couldn't expl=
ain
how) but you can change the emulation of your physical terminal (hp 700/9=
6)
to vt100 or vt102 ;-)

hth,
    Joel


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
