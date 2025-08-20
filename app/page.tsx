import { Button } from "@/components/ui/button";

export default function Home() {
  return (
    <div className="font-sans flex flex-col items-center justify-center min-h-screen p-8 gap-16 sm:p-20"> 
        <h1 className="text-2xl font-bold text-blue-900 sm:text-2xl">
          VALTO SILVA - v1 2025
        </h1>  

         <Button variant="outline" size="lg">
              Sign In
        </Button>     
        
    </div>
  );
}
