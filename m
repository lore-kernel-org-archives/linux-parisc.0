From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] hppa glibc clone() patch proposal (3/3)
Date: Fri, 24 Mar 2006 09:51:20 -0700
Message-ID: <20060324165120.GC4206@colo.lackof.org>
References: <IWMNAP$23D07646E4F7FC13AA5E343EDFB71AEA@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Parisc List <parisc-linux@lists.parisc-linux.org>,
 Kyle McMartin <kyle@parisc-linux.org>
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <IWMNAP$23D07646E4F7FC13AA5E343EDFB71AEA@scarlet.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Mar 24, 2006 at 11:18:25AM +0100, Joel Soete wrote:
> Hello Mike, pa*,
> 
> And this last step is my actual fix proposal:
...
>  ENTRY(__clone)
> +       /* Sanity check arguments.  */
> +       comib,=         0, %arg0, .Larg_error   /* no NULL function pointers */
> +       ldi             -EINVAL, %ret0
> +       comib,=         0, %arg1, .Larg_error   /* no NULL stack pointers */
> +       nop

If this is correct, then I would prefer:

	/* catch NULL stack or function ptrs */
	xor		%arg1, %arg0, %ret0
	comib,=,n	0, %ret0, .Larg_error
	ldi             -EINVAL, %ret0


> 
>         /* Save the fn ptr and arg on the new stack.  */
>         stwm            %arg0, 64(%arg1)
> @@ -60,8 +67,8 @@
> 
>         /* Create frame for function */
>         copy            %sp, %r21
> +       stw             %r21, 60(%sp)

Is %r21 used later again?
If not, then these two ops can become:
	stw            %sp, 60(%sp)

If yes, then add the copy() *after* the stw.
PA-RISC can only do one store at a time.
PA20 can do the copy in parallel with the store.

hth,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
