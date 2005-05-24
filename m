From: Daniel Coletti <dcoletti@xtech.com.ar>
Subject: Re: [parisc-linux] If this is the last message you see
Date: Tue, 24 May 2005 18:10:43 -0300
Message-ID: <42939853.4090706@xtech.com.ar>
References: <429246BD.7020606@xtech.com.ar> <42932260.4070507@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <42932260.4070507@gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

cbeerse@gmail.com wrote:
> Daniel Coletti wrote:
>> Hi,
>>     I am trying to install Debian on a HP-9000 D370. The booting works 
>> fine, I interacted a lot with the HP IPL and got it to boot from the 
>> CD and everything.
>> It boots, but is this very nice message at the bottom of my serial 
>> console terminal that says ``If this is the last message you see [...] 
>> check the FAQ and/or mailing lists´´. Well, I have and found no answer 
>> for my problem.
>> I did try a lot of different devices on the kernel booting line, 
>> parameter "console=" to be precise.
>>
>> ttyS0, ttyS1, tty0, tty1, and other things that I saw other people tried.
> 
> You should not change the console-setting to the kernel, you should 
> switch cables from serial one to serial 2 at the moment you see the 
> message. As far as I recall, you have some time to do so before you 
> start missing boot-messages.

thanks, that was it ... I did have to change the console= parameter
because it defaults to ttyB0 and does not work (ttyS0 does in the Serial
port no. 2).
Now I have problems with term emulation (I have a hp 700/96 terminal),
nothing a serial cable with minicom can't handle.

thanks again,

daniel//

> 
> If you remove the support-board, the console will not be moved from 
> serial 1 to serial 2. Since the board is (afaik) not supported (what 
> does it do at all?) there is no harm in removing it.
> 
>>
>> Am I pointing to the right direction? or I have to change something 
>> else? What other values can I try?
>>
> 
> none at all.
> 
> 
> Success,
> 
> CBee
> 


-- 
Daniel Coletti
XTech (Soluciones Linux para Empresas) - http://www.xtech.com.ar
25 de Mayo 293 - 5to. 'B'
Buenos Aires, Argentina

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
