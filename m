From: Corne Beerse <cbeerse@gmail.com>
Subject: Re: [parisc-linux] failing hp d370. boot-rom display messages
Date: Thu, 08 Jun 2006 11:28:30 +0200
Message-ID: <4487EDBE.9000904@gmail.com>
References: <4476B3C7.3000900@gmail.com> <4476C422.9010200@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: maillist parisc-linux <parisc-linux@parisc-linux.org>
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <4476C422.9010200@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Joel Soete wrote:

>
>
> Corne Beerse wrote:
>
>> Hello,
>>
>> After a last relocation, my HP D370 fails to boot. In the lcd-display 
>> it cycles trough a number of messages starting with "FLT...". Has 
>> anyone resources on the messages and the cause of the faults? It so 
>> happens that I have some spare parts (partly from a long gone D210) 
>> and I like to know what to replace or fix to get the D370 going once 
>> again.
>>
>> Thanks in advance
>>
>>
>> C.Beerse.
>>
>> btw: this message has been crosposted to both the parisc-linux and 
>> the hpux admin since it is about stuff before the os boots.
>>
> mmm, how are you sure of this?
> Can't you grab more info about console messages and post them too?
> Which os was runing before relocation (and I suppose continue to run)?
>
> Do you have access to the hp diagnostics' cd (iirc it was called 
> Support +) to make some basic hw test?
>
> Hth,
>     Joel
>
Well, the problem with the system is that id does not boot at all: it 
just cycles "flt...." numbers on the lcd, it does not come to the point 
where it spits messages to the console. About the os before the crash, 
I'm not sure anymore, I have disk packs for both linux and hp-ux and 
change them frequently just to test and check stuff. I do know it has 
the latest firmware installed since ages so that should not be the problem.

At this point, the only think I can do is remove all hardware that is 
not needed to boot and see what happens. Then restore items one by one 
and see which one is the faulty one.

 From an other answer, I got the message "flt..." is for 'floating point 
unit' hence I might even need to exchange CPUs...


CBee
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
